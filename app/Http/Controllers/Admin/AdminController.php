<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserTwoFactor;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Jenssegers\Agent\Agent;

class AdminController extends Controller
{
    public function Login()
    {
        return view('admin.login');
    }

    public function doLogin(Request $request)
    {
        $validationRules = [
            'email'    => 'required|email',
            'password' => 'required|string'
        ];
        /*apply validation*/
        $validator = Validator::make($request->all(), $validationRules);
        /*check is validation success*/
        if ($validator->fails()) {
            $response["message"] = $validator->errors()->all();
            return redirect()->to('/')->withErrors($validator->errors());
        } else {
            $user = User::where('email', '=', \request()->email)->first();
            if (empty($user) || !Hash::check($request->password, $user->password)) {
                return back()->withErrors([
                    'email' => 'The provided credentials do not match',
                ]);

            } else {
                $auth = $user->id;
                $check = $this->getUserBrowserDetails($request, $auth);
                if ($check) {
                    Auth::guard('admin')->attempt(
                        [
                            'email'    => $request->email,
                            'password' => $request->password,
                        ]
                    );
                    $request->session()->regenerate();
//                    return redirect()->to('/dashboard');
                } else {
                    $this->createUserBrowserDetails($request, $auth);
                    return redirect()->route('confirm-otp', ['id' => $user->id, 'email' => $request->email, 'password' => $request->password]);
                }
            }
            return redirect()->to('/dashboard');
        }
    }

    public function confirmOtp(Request $request)
    {
        return view('admin.otp', ['user' => $request->id]);
    }

    public function verify(Request $request)
    {
        $otp = UserTwoFactor::where('opt_number', $request->otp)
//                ->where('is_verified', '=', 0)
            ->first();
        if (!empty($otp)) {
            $user = User::find($request->id);
            $auth = Auth::guard('admin')->attempt(
                [
                    'email'    => $request->email,
                    'password' => $request->password,
                    'role_id'  => 1
                ]);
            $request->session()->regenerate();
            return redirect()->to('/dashboard');
        } else {
            return back()->withErrors([
                'otp' => 'Not Valid',
            ]);
        }
    }

    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect(route('login'));
    }
//    public function adminEdit(Request $request)
//    {
//        $data['activeMenu'] = 'Edit Profile';
//        $data['admin'] = Admin::find($request->id);
//        return view('admin.profile.profile', $data);
//    }
//
//    public function updateProfile(Request $request)
//    {
//        $admin = Admin::find($request->id);
//        if (!empty($request->name)) {
//            $admin->name = $request->name;
//        }
//        if ($request->hasFile('image')) {
//            $file = $request->file('image');
//            $timestamp = str_replace([' ', ':'], '-', Carbon::now()->toDateTimeString());
//            $image = $timestamp . '-' . str_replace([' ', ':'], '-', $file->getClientOriginalName());
//            $file->move('admin/', $image);
//            $image_url = url('/admin') . '/' . $image;
//            $admin['image'] = $image_url;
//        }
//        $admin->save();
//        Session::flash('message', 'User Updated Successfully');
//        return redirect('/dashboard');
//    }
//
    public function forgotPassword()
    {
        return view('admin.auth.forgotPassword');
    }

    public function recoverEmail(Request $request)
    {
        DB::table("password_resets")->where("email", $request->email)->delete();
        DB::table('password_resets')->insert([
            'email'      => $request->email,
            'token'      => Str::random(60),
            'created_at' => Carbon::now()
        ]);
        $token = DB::table("password_resets")->where("email", $request->email)->first();
        // }
        // $resetLink = \url('/') . "/user/resetPassword?token=" . $token->token;
        // $admin["resetlink"] = $resetLink;
        /*sending Email*/
//                    Mail::send('resetPassword', ['user' => $user], function ($m) use ($user) {
//                        $m->from('autoxquad@redeemcouponx.com', 'AUTOXQUAD');
//                        $m->to($user->email, $user->name)->subject('Reset Password!');
//                    });
        // $response["success"] = true;
        // $response["message"] = "Reset link sent on email!";
        return redirect(url('/') . "/reset-password?token=" . $token->token);

    }

//
    public function resetPassword(Request $token)
    {
        return view('admin.auth.resetPassword', $token);
    }

//
    public function updatePassword(Request $request)
    {
        $validate = [
            'password'              => 'required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'required'
        ];
        $validator = Validator::make($request->all(), $validate);
        if ($validator->fails()) {
            return back()->withErrors($validator->errors())->withInput();
        } else {

            $token = DB::table("password_resets")->where("token", $request->token)->first();
            if (!empty($token)) {
                $email = User::where("email", $token->email)->first();

                if (!empty($email)) {
                    $email->password = Hash::make($request->password);
                    $email->save();
                    DB::table("password_resets")->where("email", $token->email)->delete();
                    return back()->with('success', 'Password Updates!');
                } else {
                    return back()->with('error', 'Wrong Email!');
                }
            } else {
                return back()->with('error', 'Link Not Found Or Expired!');
            }
        }
    }
//
//    public function inbox()
//    {
//        return view('admin.profile.inbox');
//    }

    private function getUserBrowserDetails($request, $auth)
    {
        // Create an instance of the Agent class
        $agent = new Agent();

        // Get the User-Agent string from the request
        $userAgent = $request->header('User-Agent');

        // Set the User-Agent string for parsing (optional, as it defaults to the request header)
        $agent->setUserAgent($userAgent);
        // Extract browser details
        $data = UserTwoFactor::where([
            'user_id'    => $auth,
            'opt_number' => '1234',
            'ip_address' => $request->ip(),
            'browser'    => $agent->browser(),
            'version'    => $agent->version($agent->browser()),
            'platform'   => $agent->platform(),
            'is_mobile'  => $agent->isMobile(),
            'is_desktop' => $agent->isDesktop(),
        ])->first();

        return !empty($data) ? true : false;
    }

    private function createUserBrowserDetails($request, $auth)
    {
        // Create an instance of the Agent class
        $agent = new Agent();

        // Get the User-Agent string from the request
        $userAgent = $request->header('User-Agent');

        // Set the User-Agent string for parsing (optional, as it defaults to the request header)
        $agent->setUserAgent($userAgent);
        // Extract browser details
        $data = UserTwoFactor::create([
            'user_id'    => $auth,
            'opt_number' => '1234',
            'ip_address' => $request->ip(),
            'browser'    => $agent->browser(),
            'version'    => $agent->version($agent->browser()),
            'platform'   => $agent->platform(),
            'is_mobile'  => $agent->isMobile(),
            'is_desktop' => $agent->isDesktop(),
        ]);
        return !empty($data) ? true : false;
    }
}

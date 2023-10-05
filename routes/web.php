<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\HistoryController;
use App\Http\Controllers\Admin\MachineProductController;
use App\Http\Controllers\Admin\MachinesController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ProductVariationControler;
use App\Http\Controllers\Admin\RawController;
use App\Http\Controllers\Admin\RecipeController;
use App\Http\Controllers\Admin\RegionController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\ShiftController;
use App\Http\Controllers\Admin\ShiftManagerController;
use App\Http\Controllers\Admin\StateController;
use App\Http\Controllers\Admin\UnitManagerController;
use App\Http\Controllers\Admin\UnitsController;
use App\Http\Controllers\Admin\BannerController;
use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\CountryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\UnitShiftController;
use App\Http\Controllers\Admin\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::group(['namespace' => 'Admin'], function () {
    Route::get('/', [AdminController::class, 'Login'])->name('login');

    Route::post('/dologin', [AdminController::class, 'doLogin'])->name('DoLogin');

    Route::post('/verify-otp', [AdminController::class, 'verify'])->name('verify.otp');

    Route::get('/forgot-password', [AdminController::class, 'forgotPassword'])->name('PasswordForgot');

    Route::get('/recover-password', [AdminController::class, 'recoverEmail'])->name('EmailRecover');

    Route::get('/forgotPassword/forgotPassword{token?}', [AdminController::class, 'resetPassword'])->name('PasswordReset');

    Route::post('/update-password', [AdminController::class, 'updatePassword'])->name('PasswordUpdate');

});

Route::get('admin/logout', [AdminController::class, 'logout'])->name('Logout');


Route::group(["prefix" => "/", "middleware" => "auth:admin"], function () {


    Route::get('/dashboard', [DashboardController::class, 'dashboardIndex'])->name('dashboard');

    Route::get('/edit-profile/{id}', [AdminController::class, 'adminEdit'])->name('admin-Edit');

    Route::post('/update-profile', [AdminController::class, 'updateProfile']);

//units
    Route::resource('units', UnitsController::class);
    Route::get('units-table', [UnitsController::class, 'tableData'])->name('tableUnits');

    /*Units Shift*/
    Route::resource('units-shift', UnitShiftController::class);
    Route::get('units-shift-table', [UnitShiftController::class, 'tableData'])->name('tableUnitShift');

    /*Shift*/
    Route::resource('shift', ShiftController::class);

    Route::resource('unitmanager', UnitManagerController::class);

    /*machine-product*/
    Route::resource('machine-product', MachineProductController::class);
    Route::get('MachineProduct-table', [MachineProductController::class, 'tableData'])->name('tableMachineProduct');


//machines

    Route::resource('machines', MachinesController::class);
    Route::get('machine-table', [MachinesController::class, 'tableData'])->name('tableMachine');


    Route::resource('state', StateController::class);
    Route::get('units-state', [StateController::class, 'tableData'])->name('tableState');

    /*Country*/
    Route::get('country', [CountryController::class, 'index'])->name('Country');
    Route::get('country-table', [CountryController::class, 'tableCountry'])->name('countryTable');

    Route::get('add-country', function () {
        return view('admin.country.addCountry');
    })->name('addCountry');

    Route::post('create-country', [CountryController::class, 'createCountry'])->name('createCountry');

    /*City*/
    Route::get('city', [CityController::class, 'index'])->name('City');

    Route::get('city-table', [CityController::class, 'tableCity'])->name('cityTable');

    Route::get('add-city', [CityController::class, 'create'])->name('addCity');

    Route::post('create-city', [CityController::class, 'store'])->name('createCity');


    /*Role*/
    Route::resource('role', RoleController::class);
    Route::get('listData', [RoleController::class, 'tableData'])->name('role.listData');

    /*Users*/

    Route::resource('users', UserController::class);
    Route::get('user-list', [UserController::class, 'tableData'])->name('user.tableData');


    Route::get('/pdf-banners', [BannerController::class, 'PDF'])->name('BannersPDF');
    Route::get('BannerCreate', [BannerController::class, 'tableBanner'])->name('BannerCreate');


});

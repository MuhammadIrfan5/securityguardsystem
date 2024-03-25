<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\CalendarController;
use App\Http\Controllers\Admin\ConfirmationCallController;
use App\Http\Controllers\Admin\EmployeeController;
use App\Http\Controllers\Admin\JobController;
use App\Http\Controllers\Admin\LocationController;
use App\Http\Controllers\Admin\LocationTypeController;
use App\Http\Controllers\Admin\MonitoringController;
use App\Http\Controllers\Admin\PrivilegeController;
use App\Http\Controllers\Admin\RescheduleController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\ScheduleController;
use App\Http\Controllers\Admin\StateController;
use App\Http\Controllers\Admin\BannerController;
use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\CountryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\TimeSheetController;
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
    Route::get('/confirm-otp', [AdminController::class, 'confirmOtp'])->name('confirm-otp');

    Route::get('/recover-password', [AdminController::class, 'recoverEmail'])->name('EmailRecover');

    Route::get('/forgotPassword/forgotPassword{token?}', [AdminController::class, 'resetPassword'])->name('PasswordReset');

    Route::post('/update-password', [AdminController::class, 'updatePassword'])->name('PasswordUpdate');

});

Route::get('admin/logout', [AdminController::class, 'logout'])->name('Logout');


Route::group(["prefix" => "/", "middleware" => "auth:admin"], function () {


    Route::get('/dashboard', [DashboardController::class, 'dashboardIndex'])->name('dashboard');

    Route::get('/edit-profile/{id}', [AdminController::class, 'adminEdit'])->name('admin-Edit');

    Route::post('/update-profile', [AdminController::class, 'updateProfile']);

    Route::resource('state', StateController::class);
    Route::get('units-state', [StateController::class, 'tableData'])->name('tableState');

    /*Country*/
    Route::resource('country', CountryController::class);
    Route::get('country-table', [CountryController::class, 'tableCountry'])->name('countryTable');


    /*City*/
    Route::resource('city', CityController::class);
    Route::get('city-table', [CityController::class, 'tableCity'])->name('cityTable');

    /*Users*/
    Route::resource('users', UserController::class);
    Route::get('user-list', [UserController::class, 'tableData'])->name('user.tableData');

    /*Employee*/
    Route::resource('employee', EmployeeController::class);
    Route::get('employee-list', [EmployeeController::class, 'tableData'])->name('employee.tableData');

    /*Location*/
    Route::resource('location', LocationController::class);
    Route::get('location-list', [LocationController::class, 'tableData'])->name('location.tableData');

    /*Location type*/
    Route::resource('locationType', LocationTypeController::class);
    Route::get('locationType-list', [LocationTypeController::class, 'tableData'])->name('locationType.tableData');

    /*Location type*/
    Route::resource('assign-job', JobController::class);
    Route::get('assign-job-list', [JobController::class, 'tableData'])->name('assign.job.tableData');

    /*Monitoring*/
    Route::resource('monitoring', MonitoringController::class);
    Route::get('monitoring-list', [MonitoringController::class, 'tableData'])->name('monitoring.tableData');

    /*Time Sheet*/
    Route::resource('time-sheet', TimeSheetController::class);
    Route::get('time-sheet-list', [TimeSheetController::class, 'tableData'])->name('time.sheet.tableData');

    Route::get('time-sheet-create', [TimeSheetController::class, 'create'])->name('time.sheet.create');

    /*Confirmation Call*/
    Route::resource('confirmation-call', ConfirmationCallController::class);
    Route::get('confirmation-call-list', [ConfirmationCallController::class, 'tableData'])->name('confirmation.call.tableData');

    /*Privileges*/
    Route::resource('privilege', PrivilegeController::class);
    Route::get('privilege-list', [PrivilegeController::class, 'tableData'])->name('privilege.tableData');


    /*AJAX API*/
    Route::get('get-employee', [TimeSheetController::class, 'getEmployees']);

    Route::get('/schedule', [CalendarController::class, 'index'])->name('calendar');
    Route::get('/fullcalender', [CalendarController::class, 'getEvents'])->name('getEvents');
    Route::post('/event/add', [CalendarController::class, 'addEvent'])->name('CRUD.Event');
    Route::post('/event/update', [CalendarController::class, 'updateEvent']);
    Route::post('/event/delete', [CalendarController::class, 'deleteEvent']);
    Route::get('get-locations', [CalendarController::class, 'getLocations']);
    Route::get('get-employees', [CalendarController::class, 'getEmployee']);
    Route::get('get-edit', [CalendarController::class, 'getEdit']);
    Route::get('get-locations-list', [CalendarController::class, 'getLocationlist'])->name('location.list');


    Route::get('/schedule-user', [ScheduleController::class, 'index'])->name('scheduleIndex');
    Route::get('/fullcalender', [ScheduleController::class, 'getEvents'])->name('getEvents');

});

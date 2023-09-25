<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        Log::info('EmployeeController@store');

        return Employee::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        error_log($request);

        return Employee::create([
            'name' => $request->name,
            'bank' => $request->bank,
            'address' => $request->address,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Employee::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $employee = Employee::find($id);
        $employee->name = $request->name;
        $employee->bank = $request->bank;
        $employee->address = $request->address;
        $employee->save();

        return $employee;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        error_log($id);

        return Employee::destroy($id);
    }
}

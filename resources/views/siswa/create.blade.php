@extends('layouts/master')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <h1>Tambah Data Siswa</h1>
        </div>
    </div>

    {{-- Create a edit form --}}
    <form action="/siswa" method="post">
        @csrf
        <div class="field">
            <label class="label">Nama</label>
            <div class="control">
                <input class="input" type="text" placeholder="Nama" name="nama" required>
            </div>
        </div>
        <div class="field">
            <label class="label">Email</label>
            <div class="control">
                <input class="input" type="email" placeholder="Email" name="email" required>
            </div>
        </div>
        <div class="field">
            <label class="label">Password</label>
            <div class="control">
                <input class="input" type="text" placeholder="Password" name="password" required>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <div class="field">
                    <label class="label">Kelas</label>
                    <div class="select">
                        <select name="kelas" required>
                            <option selected disabled>Pilih Kelas</option>
                            <option value="X">X</option>
                            <option value="XI">XI</option>
                            <option value="XII">XII</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="field">
                    <label class="label">Jurusan</label>
                    <div class="select">
                        <select name="jurusan" required>
                            <option selected disabled>Pilih Jurusan</option>
                            <option value="RPL">RPL</option>
                            <option value="TKJ">TKJ</option>
                            <option value="MM">MM</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="field">
            <label class="label">Alamat</label>
            <div class="control">
                <input class="input" type="text" placeholder="Alamat" name="alamat" required>
            </div>
        </div>
        <div class="field">
            <label class="label">No. Telp</label>
            <div class="control">
                <input class="input" type="text" placeholder="No Telp" name="no_telp" required>
            </div>
        </div>

        <div class="field">
            <div class="control">
                <button type="submit" class="button is-link">Simpan</button>
            </div>
        </div>
    </form>
@endsection

@extends('layouts/master')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <h1>Edit Data Siswa</h1>
        </div>
    </div>

    {{-- Create a edit form --}}
    <form action="/siswa/{{ $siswa->id }}" method="post">
        @csrf
        @method('PUT')
        <div class="field">
            <label class="label">Nama</label>
            <div class="control">
                <input class="input" type="text" placeholder="Nama" name="nama" value="{{ $siswa->nama }}" required>
            </div>
        </div>
        <div class="field">
            <label class="label">Email</label>
            <div class="control">
                <input class="input" type="email" placeholder="Email" name="email" value="{{ $siswa->email }}"
                    required>
            </div>
        </div>
        <div class="field">
            <label class="label">Password</label>
            <div class="control">
                <input class="input" type="text" placeholder="Password" name="password" value="{{ $siswa->password }}"
                    required>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <div class="field">
                    <label class="label">Kelas</label>
                    <div class="select">
                        <select name="kelas" required>
                            <option value="X" selected="{{ $siswa->kelas === 'X' }}">X</option>
                            <option value="XI" selected="{{ $siswa->kelas === 'XI' }}">XI</option>
                            <option value="XII" selected="{{ $siswa->kelas === 'XII' }}">XII</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="field">
                    <label class="label">Jurusan</label>
                    <div class="select">
                        <select name="jurusan" required>
                            <option value="RPL" selected="{{ $siswa->kelas === 'RPL' }}">RPL</option>
                            <option value="TKJ" selected="{{ $siswa->kelas === 'TKJ' }}">TKJ</option>
                            <option value="MM" selected="{{ $siswa->kelas === 'MM' }}">MM</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="field">
            <label class="label">Alamat</label>
            <div class="control">
                <input class="input" type="text" placeholder="Alamat" name="alamat" value="{{ $siswa->alamat }}"
                    required>
            </div>
        </div>
        <div class="field">
            <label class="label">No. Telp</label>
            <div class="control">
                <input class="input" type="text" placeholder="No Telp" name="no_telp" value="{{ $siswa->no_telp }}"
                    required>
            </div>
        </div>

        <div class="field">
            <div class="control">
                <button type="submit" class="button is-link">Simpan</button>
            </div>
        </div>
    </form>
@endsection

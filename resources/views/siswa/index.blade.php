@extends('layouts/master')

@section('content')
    <table class="table is-fullwidth">
        <thead>
            <tr>
                <th>Nama</th>
                <th>Kelas</th>
                <th>Jurusan</th>
                <th>Alamat</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Nama</th>
                <th>Kelas</th>
                <th>Jurusan</th>
                <th>Alamat</th>
                <th>Aksi</th>
            </tr>
        </tfoot>
        <tbody>
            {{-- Looping data siswa --}}
            @foreach ($siswas as $siswa)
                <tr>
                    <td>{{ $siswa->nama }}</td>
                    <td>{{ $siswa->kelas }}</td>
                    <td>{{ $siswa->jurusan }}</td>
                    <td>{{ $siswa->alamat }}</td>
                    <td>
                        <div class="is-flex">
                            <a href="/siswa/{{ $siswa->id }}/edit" class="button is-small is-info mr-3">Edit</a>
                            <form action="/siswa/{{ $siswa->id }}" method="post">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="button is-small is-danger">Hapus</button>
                            </form>
                        </div>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection

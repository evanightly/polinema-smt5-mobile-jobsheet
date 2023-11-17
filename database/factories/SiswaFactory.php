<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Siswa>
 */
class SiswaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'nama' => fake()->name(),
            'email' => fake()->unique()->safeEmail(),
            'password' => fake()->password(),
            'kelas' => fake()->randomElement(['X', 'XI', 'XII']),
            'jurusan' => fake()->randomElement(['RPL', 'TKJ', 'MM']),
            'alamat' => fake()->address(),
            'no_telp' => fake()->phoneNumber(),
        ];
    }
}

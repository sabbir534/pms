@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>List of Products</h1>

        <!-- Search Form -->
        <form method="GET" action="{{ route('products.index') }}" class="mb-3">
            <div class="input-group">
                <input type="text" name="search" class="form-control" placeholder="Search by Product ID or Description"
                    value="{{ request('search') }}">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-primary">Search</button>
                    <!-- Clear Search Button -->
                    @if (request('search'))
                        <a href="{{ route('products.index') }}" class="btn btn-secondary">Clear</a>
                    @endif
                </div>
            </div>
        </form>

        <!-- Sorting and Add Product Button -->
        <div class="d-flex justify-content-between mb-3">
            <div>
                <a href="{{ route('products.create') }}" class="btn btn-success">Add Product</a>
            </div>
            <div>
                <a href="{{ route('products.index') }}?sort=name" class="btn btn-link">Sort by Name</a>
                <a href="{{ route('products.index') }}?sort=price" class="btn btn-link">Sort by Price</a>
            </div>
        </div>

        <!-- Success Message -->
        @if (session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <!-- Product Table -->
        <table class="table table-bordered">
            <thead>
                <tr>

                    <th>Product ID</th>
                    <th>Description</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Image</th>
                    <th class="col-sm-3">Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($products as $product)
                    <tr>

                        <td>{{ $product->product_id }}</td>
                        <td>{{ $product->description }}</td>
                        <td>{{ $product->name }}</td>
                        <td>${{ number_format($product->price, 2) }}</td>
                        <td>{{ $product->stock ?? 'N/A' }}</td>
                        <td>
                            @if ($product->image)
                                <img src="{{ Storage::url($product->image) }}" alt="Product Image" width="100">
                            @else
                                <p>No image available</p>
                            @endif
                        </td>
                        <td>
                            <a href="{{ route('products.show', $product) }}" class="btn btn-info btn-sm">View</a>
                            <a href="{{ route('products.edit', $product) }}" class="btn btn-warning btn-sm">Edit</a>
                            <form action="{{ route('products.destroy', $product) }}" method="POST"
                                style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <!-- Pagination -->
        <div class="pagination-wrapper mt-4">
            {{ $products->appends(request()->query())->links('pagination::bootstrap-4') }}
        </div>
    </div>
@endsection

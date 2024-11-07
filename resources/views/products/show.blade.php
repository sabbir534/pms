@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>{{ $product->name }}</h1>

        <p><strong>Product ID:</strong> {{ $product->product_id }}</p>
        <p><strong>Description:</strong> {{ $product->description ?? 'N/A' }}</p>
        <p><strong>Price:</strong> ${{ number_format($product->price, 2) }}</p>
        <p><strong>Stock:</strong> {{ $product->stock ?? 'N/A' }}</p>

        @if ($product->image)
            <p><strong>Image:</strong></p>
            <img src="{{ Storage::url($product->image) }}" class="img-fluid" alt="Product Image">
        @endif

        <a href="{{ route('products.index') }}" class="btn btn-secondary mt-3">Back to Products</a>
    </div>
@endsection

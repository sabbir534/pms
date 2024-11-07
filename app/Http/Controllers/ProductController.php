<?php
namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $query = Product::query();

        // Check if there is a search term
        if ($request->has('search')) {
            $searchTerm = $request->input('search');
            $query->where('product_id', 'like', "%{$searchTerm}%")
                ->orWhere('description', 'like', "%{$searchTerm}%");

        }

        // Optionally handle sorting
        if ($request->has('sort')) {
            $sortBy = $request->input('sort');
            if (in_array($sortBy, ['name', 'price'])) {
                $query->orderBy($sortBy);
            }
        }

        // Fetch products with pagination
        $products = $query->paginate(10);

        return view('products.index', compact('products'));
    }

    public function create()
    {
        return view('products.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|unique:products,product_id',
            'name' => 'required',
            'price' => 'required|numeric',
            'image' => 'nullable|image|mimes:jpg,png,jpeg,gif|max:2048',
        ]);

        $data = $request->only(['product_id', 'name', 'description', 'price', 'stock']);

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('images', 'public');
            $data['image'] = $imagePath;
        }

        Product::create($data);

        return redirect()->route('products.index')->with('success', 'Product created successfully!');
    }

    public function show(Product $product)
    {
        return view('products.show', compact('product'));
    }

    public function edit(Product $product)
    {
        return view('products.edit', compact('product'));
    }

    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric',
            'image' => 'nullable|image|mimes:jpg,png,jpeg,gif|max:2048',
        ]);

        $data = $request->only(['name', 'description', 'price', 'stock']);

        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($product->image && Storage::exists('public/' . $product->image)) {
                Storage::delete('public/' . $product->image);
            }

            $imagePath = $request->file('image')->store('images', 'public');
            $data['image'] = $imagePath;
        }

        $product->update($data);

        return redirect()->route('products.index')->with('success', 'Product updated successfully!');
    }

    public function destroy(Product $product)
    {
        // Delete image if exists
        if ($product->image && Storage::exists('public/' . $product->image)) {
            Storage::delete('public/' . $product->image);
        }

        $product->delete();

        return redirect()->route('products.index')->with('success', 'Product deleted successfully!');
    }
}

<?php

namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

trait ImageTrait {

    /**
     * @param Request $request
     * @return $this|false|string
     */
    public function imageUpload($query,$modelName) // Taking input image as parameter
    {
        $imageName = time() . '.' . $query->getClientOriginalExtension();
        $imagePath = $modelName.'/' . $imageName;
        // Store the image in the storage disk (you can customize the disk in config/filesystems.php)
        Storage::disk('public')->put($imagePath, file_get_contents($query));

        // Set the image attribute in the model to the image path
        return $imagePath;
    }

    public function removeImage($publicUrl = "")
    {
        $image = parse_url($publicUrl);
        $url = "../public_html" . $image["path"];
        return File::delete($url);
    }
}

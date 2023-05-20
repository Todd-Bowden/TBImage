
#include <metal_stdlib>
using namespace metal;

kernel void alpha(texture2d<half,   access::read>   inTexture   [[ texture(0) ]],
                  texture2d<half,   access::read>   inAlpha     [[ texture(1) ]],
                  texture2d<half,   access::write>  outTexture  [[ texture(2) ]],
                  uint2                             gid         [[ thread_position_in_grid ]]) {
    
    // Check bounds
    if((gid.x >= outTexture.get_width()) || (gid.y >= outTexture.get_height())) {
        return;
    }
    
    // Get pixel
    half4 pixel = inTexture.read(gid);
    
    // Get alpha value
    half a = inAlpha.read(gid).r;
    
    // Write rgba to outTexture
    outTexture.write(half4(pixel.rgb * a, a), gid);
}




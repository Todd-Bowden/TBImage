
#include <metal_stdlib>
using namespace metal;

kernel void flip_horizontal_rgba(texture2d<half, access::read>  inTexture  [[ texture(0) ]],
                                 texture2d<half, access::write> outTexture [[ texture(1) ]],
                                 uint2                          gid        [[ thread_position_in_grid ]]) {
    
    // Check bounds
    if((gid.x >= outTexture.get_width()) || (gid.y >= outTexture.get_height())) { return; }
    
    // Get pixel
    uint w = inTexture.get_width();
    half4 p = inTexture.read(uint2(w-gid.x, gid.y));
    
    // Write to outTexture
    outTexture.write(p, gid);
}

kernel void flip_horizontal_gray(texture2d<half, access::read>  inTexture  [[ texture(0) ]],
                                 texture2d<half, access::write> outTexture [[ texture(1) ]],
                                 uint2                          gid        [[ thread_position_in_grid ]]) {
    
    // Check bounds
    if((gid.x >= outTexture.get_width()) || (gid.y >= outTexture.get_height())) { return; }
    
    // Get pixel
    uint w = inTexture.get_width();
    half p = inTexture.read(uint2(w-gid.x, gid.y)).r;
    
    // Write to outTexture
    outTexture.write(p, gid);
}

kernel void flip_vertical_rgba(texture2d<half, access::read>  inTexture  [[ texture(0) ]],
                               texture2d<half, access::write> outTexture [[ texture(1) ]],
                               uint2                          gid        [[ thread_position_in_grid ]]) {
    
    // Check bounds
    if((gid.x >= outTexture.get_width()) || (gid.y >= outTexture.get_height())) { return; }
    
    // Get pixel
    uint h = inTexture.get_height();
    half4 p = inTexture.read(uint2(gid.x, h-gid.y));
    
    // Write to outTexture
    outTexture.write(p, gid);
}

kernel void flip_vertical_gray(texture2d<half, access::read>  inTexture  [[ texture(0) ]],
                               texture2d<half, access::write> outTexture [[ texture(1) ]],
                               uint2                          gid        [[ thread_position_in_grid ]]) {
    
    // Check bounds
    if((gid.x >= outTexture.get_width()) || (gid.y >= outTexture.get_height())) { return; }
    
    // Get pixel
    uint h = inTexture.get_height();
    half p = inTexture.read(uint2(gid.x, h-gid.y)).r;
    
    // Write to outTexture
    outTexture.write(p, gid);
}






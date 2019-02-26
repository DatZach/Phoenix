/// @func hud_step_toasts()
/// Process toast queue

var count = ds_list_size(toasts);
for(var i = 0; i < count; ++i) {
    var toast = toasts[| i];
    toast[@ k_toast.frames] += toast[@ k_toast.frameStep];
    
    if (toast[@ k_toast.frames] <= 0) {
        ds_list_delete(toasts, i);
        --count;
        ++i;
    }
}
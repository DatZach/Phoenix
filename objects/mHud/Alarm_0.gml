/// @desc  Clear all toasts

var count = ds_list_size(toasts);
for(var i = 0; i < count; ++i) {
    var toast = toasts[| i];
    toast[@ k_toast.frameStep] = -1;
}

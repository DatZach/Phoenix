/// @func toast_item(itemKey)
/// Toasts an item
/// @param itemKey string Item Key

enum k_toast {
	item_key,		// string
	frames,			// real
	frameStep,		// real
	_size
}

var itemKey = argument0;

with(mHud) {
	var toast = array_create(k_toast._size);
		toast[@ k_toast.item_key] = itemKey;
		toast[@ k_toast.frames] = 0;
		toast[@ k_toast.frameStep] = 1;
    ds_list_add(toasts, toast);
        
    alarm[0] = room_speed * 3;
}

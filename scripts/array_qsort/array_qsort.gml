/// @func array_qsort(array, predicate)
/// port from http://www.algolist.net/Algorithms/Sorting/Quicksort
/// @param array array
/// @param comparison script

var _array    = argument0;
var _compare = argument1;

var size = array_length_1d(_array);
var sortStack = array_create(size); //floor(j/4)); // guesstimate
var stackHeight = 0;
sortStack[0] = 0;
sortStack[1] = size - 1;
stackHeight = 2;

while (stackHeight > 0) {
  var i = sortStack[stackHeight - 2];
  var j = sortStack[stackHeight - 1];
  var left = i, right = j;
  var pivot = _array[@ floor((left + right) / 2)];
  stackHeight -= 2;
  
  // i do believe we can swap a BST in here
  while (i <= j) {
    while (script_execute(_compare, _array[@ i], pivot) < 0) // if (_array[|i] < pivot)
      i++;
    while (script_execute(_compare, _array[@ j], pivot) > 0) // if (_array[|j] > pivot)
      j--;
    if (i <= j) {
      var tmp = _array[@ i];
      _array[@ i] = _array[@ j];
      _array[@ j] = tmp;
      i++;
      j--; 
    }
  }

  /* "recursion" */
  if (i < right) {
    sortStack[stackHeight] = i;
    sortStack[stackHeight + 1] = right;
    stackHeight+=2;
  }

  if (left < j) {
    sortStack[stackHeight] = left;
    sortStack[stackHeight + 1] = j;
    stackHeight+=2;
  }   
}
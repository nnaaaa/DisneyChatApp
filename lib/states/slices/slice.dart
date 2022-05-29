

abstract class Slice<S>{
  S? initState();
  S? Function(S?,dynamic) reducer();
}
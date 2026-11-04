# Cross-Language Verification Report - native keyword

## Test Date: 2026-06-23

## Languages Compared
- **ArkTS** (ArkTS static compiler es2panda + ark VM)
- **Java** (Java 21.0.11, javac + java VM)
- **Swift** (not available on test system; analysis based on language spec)

---

## 1. Java Verification Results

### 1.1 Compile-Pass Equivalents
| Test | Java Result | ArkTS Result | Match |
|------|-------------|--------------|-------|
| Native function/method declaration (no body) | Compiles OK | Compiles OK | YES |
| Static native method | Compiles OK | Compiles OK | YES |
| Private native method | Compiles OK | Compiles OK | YES |
| Generic native method | Compiles OK (Java generics) | Compiles OK (ArkTS generics) | YES |
| Override native method in subclass | Compiles OK | Compiles OK | YES |
| Class with native + regular methods | Compiles OK, runs OK | Compiles OK, runs OK | YES |

### 1.2 Compile-Fail Equivalents
| Test | Java Error | ArkTS Error | Match |
|------|-----------|-------------|-------|
| Native method with body | "本机方法不能带有主体" | ESE0083: "Native, Abstract and Declare methods cannot have body" | YES |
| native + abstract combination | "非法的修饰符组合: abstract和native" | ESE0047: "Invalid method modifier(s): ... native modifier" | YES |
| native in interface | "此处不允许使用修饰符native" | ESY0224: "Identifier expected, got 'native'" | YES |
| Native method without return type | Java requires return type | ESE0018: "Native and Declare methods should have explicit return type" | YES |

### 1.3 Runtime Behavior
| Test | Java | ArkTS | Notes |
|------|------|-------|-------|
| Calling unimplemented native method | UnsatisfiedLinkError (runtime) | LinkerUnresolvedMethodError (runtime) | Similar concept, different exception type |
| Regular methods in class with native methods | Works normally | Works normally | Same behavior |

---

## 2. Swift Comparison (Theoretical, not verified on system)

Swift does not have a `native` keyword. Instead, Swift uses:

### 2.1 C Interop Pattern
```swift
// ArkTS:
//   native function getValue(): int

// Swift equivalent:
// In bridging header:
//   extern int get_value(void);
// Then call directly in Swift:
//   let value = get_value()
```

### 2.2 @_cdecl Attribute
```swift
// For exposing Swift functions to C:
@_cdecl("swift_function_name")
func swiftFunction() -> Int32 {
    return 42
}
```

### 2.3 Key Differences from ArkTS
| Aspect | ArkTS | Swift |
|--------|-------|-------|
| Keyword | `native` | No direct equivalent |
| Syntax | `native function foo(): int` | C functions via bridging header or `@_cdecl` |
| Body requirement | No body allowed | Swift functions always have bodies |
| abstract + native | Compile error (ESE0047) | Not applicable (different paradigm) |
| Interface native | Compile error (ESY0224) | Protocols can require ObjC-conformant methods |
| Error handling | Compile-time errors for misuse | Compile-time errors depend on C interop setup |
| Runtime error on missing impl | LinkerUnresolvedMethodError | Linker error or runtime crash |

---

## 3. Trilateral Comparison Table

| Feature | ArkTS | Java | Swift |
|---------|-------|------|-------|
| Native keyword | `native` | `native` | N/A (uses `@_cdecl`, C interop) |
| Native function (top-level) | YES | NO (must be in class) | N/A (C functions via bridging) |
| Native method body | Forbidden (ESE0083) | Forbidden | N/A (always has body) |
| Native + abstract | Forbidden (ESE0047) | Forbidden | N/A |
| Native in interface | Forbidden (ESY0224) | Forbidden | N/A (protocols handle differently) |
| Native + static | Allowed | Allowed | N/A |
| Native + private | Allowed | Allowed | N/A |
| Native + generic | Allowed | Allowed (type erasure) | N/A |
| Override native method | Allowed | Allowed | Allowed (Swift override) |
| Missing impl error | LinkerUnresolvedMethodError | UnsatisfiedLinkError | Linker error |
| Error catchable | YES (try/catch) | YES (try/catch) | N/A |

---

## 4. Summary

1. **ArkTS native == Java native**: The ArkTS `native` keyword has nearly identical semantics to Java's `native` keyword. Both:
   - Require no method body
   - Cannot be combined with `abstract`
   - Cannot be used in interfaces
   - Support `static` and `private` modifiers
   - Throw runtime errors when called without implementation

2. **ArkTS differs from Java in**: ArkTS allows top-level native functions (`native function foo(): void` at file scope), while Java requires all code to be inside a class. Java does not have this concept since Java has no top-level functions.

3. **Swift is fundamentally different**: Swift has no `native` keyword. Instead, it relies on:
   - Bridging headers for C function declarations
   - Module imports for C/Objective-C libraries
   - `@_cdecl` attribute for exposing Swift functions to C

4. **Semantic alignment**: ArkTS and Java share nearly 100% semantic alignment for the `native` keyword, which is expected since ArkTS targets similar use cases (JNI-like native interop for mobile platforms).

/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
/**
 * Swift equivalent of ArkTS 17.10.1 Native Functions.
 *
 * Swift does NOT have a `native` keyword like Java/ArkTS.
 * Instead, Swift uses:
 * 1. @_cdecl attribute for C-compatible function declarations
 * 2. C/Objective-C interop via bridging headers or module imports
 * 3. @_silgen_name for low-level symbol naming
 *
 * Key differences from ArkTS native:
 * - Swift: no `native` keyword; uses attributes and interop
 * - Swift: C functions are declared via `extern` or bridging headers
 * - Swift: no equivalent of ArkTS's ESE0083 error (different safety model)
 * - Swift: compile-time error for @_cdecl + body is not applicable
 *   (the attribute marks a Swift func as callable from C)
 */

// Swift C-interop style (via bridging header):
// In a real project, you'd have:
//   extern int get_value(void);
//   extern const char* get_name(void);
//   extern void set_value(int v);
// in a bridging header, then call them directly in Swift.

// @_cdecl example (marks Swift function as callable from C):
// @_cdecl("swift_get_version")
// func getVersion() -> UnsafePointer<CChar>? {
//     return "1.0".cString(using: .utf8)
// }

// Unlike ArkTS:
// - No `native` keyword exists in Swift
// - C function interop is handled at the module/linker level
// - No equivalent of "Native ... methods cannot have body" error
// - Swift functions always have bodies (unless @_transparent or similar)

print("Swift native comparison: see comments for details")
print("Swift uses @_cdecl / C interop instead of 'native' keyword")

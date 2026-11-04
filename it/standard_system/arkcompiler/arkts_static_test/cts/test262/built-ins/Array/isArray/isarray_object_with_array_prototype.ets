/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: isarray_object_with_array_prototype
// description: Array.isArray applied to an object with Array.prototype as the prototype returns false
// Conversion notes:
//  - Source built Con.prototype = Array.prototype (JS prototype-chain construction); ArkTS has no
//    prototype-chain manipulation, so a custom class instance is used as the equivalent non-array
//    object and Array.isArray must still return false.

class Con {}

function main(): void {
    let child: Con = new Con();
    arktest.assertEQ(Array.isArray(child), false, 'Array.isArray(new Con()) must return false');
}
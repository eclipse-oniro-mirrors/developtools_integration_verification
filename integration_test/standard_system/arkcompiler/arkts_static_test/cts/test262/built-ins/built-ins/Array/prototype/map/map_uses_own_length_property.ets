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

// arktsid: map_uses_own_length_property
// description: Array.prototype.map - length is an own data property on an Array
// Conversion notes:
//  - Integer literals [12, 11] typed as Array<int>; result typed as Array<boolean>

function main(): void {
    let testResult: boolean[] = [12, 11].map((v: int): boolean => { return v > 10; });
    arktest.assertEQ(testResult.length, 2, 'testResult.length');
}
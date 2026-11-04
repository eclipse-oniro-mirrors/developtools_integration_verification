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
// arktsid: map_clear_returns_undefined
// description: Map.prototype.clear returns undefined
// Conversion notes: Mixed key-type entries adapted to homogeneous types for ArkTS typed Map.

function main(): void {
    let m = new Map<string, string>([['foo', 'bar']]);
    arktest.assertEQ(m.clear(), undefined, 'clear returns undefined on non-empty Map');

    let m2 = new Map<string, string>();
    arktest.assertEQ(m2.clear(), undefined, 'clear returns undefined on empty Map');
}
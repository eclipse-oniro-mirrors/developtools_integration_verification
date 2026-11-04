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
// arktsid: json_stringify_non_finite
// description: JSON.stringify serializes non-finite numbers (NaN, Infinity) as null

function main(): void {
    arktest.assertEQ(JSON.stringify(NaN), 'null', 'NaN -> null');
    arktest.assertEQ(JSON.stringify(Infinity), 'null', 'Infinity -> null');
    arktest.assertEQ(JSON.stringify(-Infinity), 'null', '-Infinity -> null');
    arktest.assertEQ(JSON.stringify([1, NaN, 3]), '[1,null,3]', 'NaN in array -> null');
    arktest.assertEQ(JSON.stringify([NaN, Infinity, -Infinity]), '[null,null,null]', 'non-finite in array');
}
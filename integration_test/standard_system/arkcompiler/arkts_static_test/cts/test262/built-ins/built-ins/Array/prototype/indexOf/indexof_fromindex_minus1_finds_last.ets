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

// arktsid: indexof_fromindex_minus1_finds_last
// description: Array.prototype.indexOf returns correct index when 'fromIndex' is -1

function main(): void {
    let x: int[] = [1, 2, 3, 4];
    arktest.assertEQ(x.indexOf(4, -1), 3, '[1, 2, 3, 4].indexOf(4, -1)');
}
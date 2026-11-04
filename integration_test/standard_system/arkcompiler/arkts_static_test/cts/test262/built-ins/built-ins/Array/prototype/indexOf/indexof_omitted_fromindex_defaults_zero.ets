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

// arktsid: indexof_omitted_fromindex_defaults_zero
// description: Array.prototype.indexOf - 'fromIndex' isn't passed

function main(): void {
    let arr: int[] = [0, 1, 2, 3, 4];
    //'fromIndex' will be set as 0 if not passed by default
    arktest.assertEQ(arr.indexOf(0), arr.indexOf(0, 0), 'arr.indexOf(0)');
    arktest.assertEQ(arr.indexOf(2), arr.indexOf(2, 0), 'arr.indexOf(2)');
    arktest.assertEQ(arr.indexOf(4), arr.indexOf(4, 0), 'arr.indexOf(4)');
}
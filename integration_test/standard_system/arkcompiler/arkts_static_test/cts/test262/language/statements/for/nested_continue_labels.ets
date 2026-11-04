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

// arktsid: nested_continue_labels
// description: Continue targets the nested, outer, and current loops correctly

function main(): void {
    let result: string = '';
    outer: for (let index: int = 0; index < 4; ++index) {
        nested: for (let inner: int = 0; inner <= index; ++inner) {
            if (index * inner == 6) {
                continue nested;
            }
            result += index.toString() + inner.toString();
        }
    }
    arktest.assertEQ(result, '001011202122303133');

    result = '';
    outer: for (let index: int = 0; index < 4; ++index) {
        nested: for (let inner: int = 0; inner <= index; ++inner) {
            if (index * inner == 6) {
                continue outer;
            }
            result += index.toString() + inner.toString();
        }
    }
    arktest.assertEQ(result, '0010112021223031');

    result = '';
    outer: for (let index: int = 0; index < 4; ++index) {
        nested: for (let inner: int = 0; inner <= index; ++inner) {
            if (index * inner == 6) {
                continue;
            }
            result += index.toString() + inner.toString();
        }
    }
    arktest.assertEQ(result, '001011202122303133');
}

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

// arktsid: exponentindicator_e_variant_7
// description: ExponentIndicator :: e

function main(): void {
    arktest.assertEQ(0e00, 0, '#0: 0e00 === 0');
    arktest.assertEQ(1e00, 1, '#1: 1e00 === 1');
    arktest.assertEQ(2e00, 2, '#2: 2e00 === 2');
    arktest.assertEQ(3e00, 3, '#3: 3e00 === 3');
    arktest.assertEQ(4e00, 4, '#4: 4e00 === 4');
    arktest.assertEQ(5e00, 5, '#5: 5e00 === 5');
    arktest.assertEQ(6e00, 6, '#6: 6e00 === 6');
    arktest.assertEQ(7e00, 7, '#7: 7e00 === 7');
    arktest.assertEQ(8e00, 8, '#8: 8e00 === 8');
    arktest.assertEQ(9e00, 9, '#9: 9e00 === 9');
}

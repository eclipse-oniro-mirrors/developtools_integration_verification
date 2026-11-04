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

// arktsid: exponentindicator_e
// description: ExponentIndicator :: e

function main(): void {
    arktest.assertEQ(0e01, 0, '#0: 0e01 === 0');
    arktest.assertEQ(1e01, 10, '#1: 1e01 === 10');
    arktest.assertEQ(2e01, 20, '#2: 2e01 === 20');
    arktest.assertEQ(3e01, 30, '#3: 3e01 === 30');
    arktest.assertEQ(4e01, 40, '#4: 4e01 === 40');
    arktest.assertEQ(5e01, 50, '#5: 5e01 === 50');
    arktest.assertEQ(6e01, 60, '#6: 6e01 === 60');
    arktest.assertEQ(7e01, 70, '#7: 7e01 === 70');
    arktest.assertEQ(8e01, 80, '#8: 8e01 === 80');
    arktest.assertEQ(9e01, 90, '#9: 9e01 === 90');
}

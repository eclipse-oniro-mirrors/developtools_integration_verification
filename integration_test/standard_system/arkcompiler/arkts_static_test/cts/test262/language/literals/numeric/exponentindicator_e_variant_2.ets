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

// arktsid: exponentindicator_e_variant_2
// description: ExponentIndicator :: E

function main(): void {
    arktest.assertEQ(0E01, 0, '#0: 0E01 === 0');
    arktest.assertEQ(1E01, 10, '#1: 1E01 === 10');
    arktest.assertEQ(2E01, 20, '#2: 2E01 === 20');
    arktest.assertEQ(3E01, 30, '#3: 3E01 === 30');
    arktest.assertEQ(4E01, 40, '#4: 4E01 === 40');
    arktest.assertEQ(5E01, 50, '#5: 5E01 === 50');
    arktest.assertEQ(6E01, 60, '#6: 6E01 === 60');
    arktest.assertEQ(7E01, 70, '#7: 7E01 === 70');
    arktest.assertEQ(8E01, 80, '#8: 8E01 === 80');
    arktest.assertEQ(9E01, 90, '#9: 9E01 === 90');
}

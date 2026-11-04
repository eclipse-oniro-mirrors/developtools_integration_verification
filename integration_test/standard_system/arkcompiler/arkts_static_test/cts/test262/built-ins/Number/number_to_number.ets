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
// arktsid: number_number_to_number
// description: Some numbers including Number.MAX_VALUE and Number.MIN_VALUE are converted to Number with explicit
// transformation

function main(): void {
    arktest.assertEQ(Number(13), 13, 'Number(13) must return 13');
    arktest.assertEQ(Number(-13), -13, 'Number(-13) must return -13');
    arktest.assertEQ(Number(1.3), 1.3, 'Number(1.3) must return 1.3');
    arktest.assertEQ(Number(-1.3), -1.3, 'Number(-1.3) must return -1.3');
}
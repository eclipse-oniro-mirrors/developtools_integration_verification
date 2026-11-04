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
// arktsid: boolean_literal_true_false
// description: Boolean literals true and false have correct type and value

function main(): void {
    arktest.assertEQ(true, true);
    arktest.assertEQ(false, false);
    arktest.assertEQ(true == false, false);
    arktest.assertEQ(true != false, true);
    arktest.assertEQ(typeof true, 'boolean');
    arktest.assertEQ(typeof false, 'boolean');
}
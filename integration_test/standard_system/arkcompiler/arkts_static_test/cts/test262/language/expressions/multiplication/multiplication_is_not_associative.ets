/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: multiplication_is_not_associative
// description: Floating-point multiplication is not always associative

function main(): void {
    let leftAssociative: double = Number.MAX_VALUE * 1.1 * 0.9;
    let explicitLeft: double = (Number.MAX_VALUE * 1.1) * 0.9;
    arktest.assertEQ(leftAssociative, explicitLeft);

    let rightAssociative: double = Number.MAX_VALUE * (1.1 * 0.9);
    arktest.assertTrue(explicitLeft !== rightAssociative);
}

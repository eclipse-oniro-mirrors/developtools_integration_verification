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

// arktsid: aggregate_error_constructor
// description: AggregateError constructor creates error with errors list, name, and message

function main(): void {
    let agg = new AggregateError([new RangeError('a'), new TypeError('b')], 'agg msg');
    arktest.assertEQ(agg.name, 'AggregateError', 'name');
    arktest.assertEQ(agg.message, 'agg msg', 'message');
    arktest.assertEQ(agg.errors.length, 2, 'errors length');
}
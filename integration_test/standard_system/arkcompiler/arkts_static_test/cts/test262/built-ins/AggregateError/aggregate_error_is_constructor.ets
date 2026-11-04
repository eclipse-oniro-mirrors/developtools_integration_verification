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

// arktsid: aggregate_error_is_constructor
// description: AggregateError is a constructor — new AggregateError() creates an AggregateError instance

function main(): void {
    // AggregateError can be constructed with new
    let ae: AggregateError = new AggregateError([], 'test');
    arktest.assertEQ(ae.name, 'AggregateError', 'new AggregateError() creates AggregateError with correct name');
    arktest.assertEQ(ae.message, 'test', 'new AggregateError() creates AggregateError with correct message');
}
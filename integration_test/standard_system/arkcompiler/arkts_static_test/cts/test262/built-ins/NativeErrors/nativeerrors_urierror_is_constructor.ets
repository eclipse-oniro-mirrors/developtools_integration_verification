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

// arktsid: nativeerrors_urierror_is_constructor
// description: URIError is a constructor — new URIError() creates a URIError instance

function main(): void {
    // URIError can be constructed with new
    let e: URIError = new URIError('test');
    arktest.assertEQ(e.name, 'URIError', 'new URIError() creates URIError with correct name');
    arktest.assertEQ(e.message, 'test', 'new URIError(\'test\') creates URIError with correct message');
}
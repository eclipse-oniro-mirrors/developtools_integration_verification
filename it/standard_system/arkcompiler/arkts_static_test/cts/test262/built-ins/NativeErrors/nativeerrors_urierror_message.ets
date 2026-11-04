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
// arktsid: nativeerrors_urierror_message
// description: URIError instances have an empty default message; the message argument is set when provided
// Conversion notes: test262 uses verifyProperty(URIError.prototype, "message", ...) requiring prototype access
// (unsupported); migrated via instance access.

function main(): void {
    let e1 = new URIError();
    arktest.assertEQ(e1.message, '', 'default message');
    let e2 = new URIError('custom');
    arktest.assertEQ(e2.message, 'custom', 'custom message');
}
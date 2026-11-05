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

// arktsid: decodeuricomponent_reserved_decoded
// description: decodeURIComponent decodes all reserved URI characters since reservedURIComponentSet is empty

function main(): void {
    // Reserved chars decoded by decodeURIComponent (uppercase hex)
    arktest.assertEQ(decodeURIComponent('%3B%2F%3F%3A%40%26%3D%2B%24%2C%23'), ';/?:@&=+$,#',
        'decodeURIComponent decodes reserved chars (uppercase)');

    // Reserved chars decoded by decodeURIComponent (lowercase hex)
    arktest.assertEQ(decodeURIComponent('%3b%2f%3f%3a%40%26%3d%2b%24%2c%23'), ';/?:@&=+$,#',
        'decodeURIComponent decodes reserved chars (lowercase)');
}
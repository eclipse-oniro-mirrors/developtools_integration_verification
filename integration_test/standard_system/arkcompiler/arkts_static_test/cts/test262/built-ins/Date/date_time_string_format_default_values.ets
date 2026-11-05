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

// arktsid: date_time_string_format_default_values
// description: Date Time String Format - specified default values will be set for all optional fields (MM, DD, mm, ss
// and time zone) when they are absent
// Conversion notes:
//  - new Date("1970").toISOString() 将缺省字段补全为 "1970-01-01T00:00:00.000Z"

function main(): void {
    let expectedDateTimeStr: string = '1970-01-01T00:00:00.000Z';
    let dateObj: Date = new Date('1970');
    let dateStr: string = dateObj.toISOString();
    let result: boolean = dateStr === expectedDateTimeStr;
    arktest.assertTrue(result, 'result !== true');
}
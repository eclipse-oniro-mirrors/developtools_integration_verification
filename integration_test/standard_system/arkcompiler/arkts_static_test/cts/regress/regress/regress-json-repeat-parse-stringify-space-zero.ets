/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

function main(): void {
  const message: String = '{"result":{"profile":{"head":{"functionName":"(root)","url":"","lineNumber":0,"totalTime' +
    '":495.7243772462511,"selfTime":0,"numberOfCalls":0,"visible":true,"callUID":2771605942,"' +
    'children":[{"functionName":"(program)","url":"","lineNumber":0,"totalTime":495.724377246' +
    '2511,"selfTime":495.7243772462511,"numberOfCalls":0,"visible":true,"callUID":1902715303,' +
    '"children":[]}]},"bottomUpHead":{"functionName":"(root)","url":"","lineNumber":0,"totalT' +
    'ime":495.7243772462511,"selfTime":0,"numberOfCalls":0,"visible":true,"callUID":277160594' +
    '2,"children":[{"functionName":"(program)","url":"","lineNumber":0,"totalTime":495.724377' +
    '2462511,"selfTime":495.7243772462511,"numberOfCalls":0,"visible":true,"callUID":19027153' +
    '03,"children":[]}]}}},"id":41}';

  const first: jsonx.JsonElement = JSON.parseJsonElement(message);
  const second: jsonx.JsonElement = JSON.parseJsonElement(message);
  arktest.assertEQ(
    JSON.stringifyJsonElement(first),
    JSON.stringifyJsonElement(second)
  );
  arktest.assertEQ(
    JSON.stringifyJsonElement(first, undefined, 0),
    JSON.stringifyJsonElement(second)
  );
}

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

// Tests the interaction of Function.prototype.bind with proxies.


// (Helper)

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0301: Can't resolve array type"
---*/

const log = [];
const logger = {};
let handler = new Proxy({}, logger);
let result;

logger.get = function(t, trap, r) {
  return function() {
    log.push([trap, ...arguments]);
    return Reflect[trap](...arguments);
  }
};

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

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0227: Unexpected token '/'."
---*/

''.match(/(A{9999999999}B|C*)*D/);
'C'.match(/(A{9999999999}B|C*)*D/);
''.match(/(A{9999999999}B|C*)*/ );
'C'.match(/(A{9999999999}B|C*)*/ );
''.match(/(9u|(2\`shj{2147483649,}\r|3|f|y|3*)+8\B)\W93+/);
'9u8 '.match(/(9u|(2\`shj{2147483649,}\r|3|f|y|3*)+8\B)\W93+/);

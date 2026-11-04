/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Let declarations with initializers are not valid as a do-while body
tags: [compile-only]
---*/
do { let x = 1; } while (false)

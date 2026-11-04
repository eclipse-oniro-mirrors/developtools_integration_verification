/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id EXP_07_13_01_016_RUNTIME_REF_FIELD_MODIFY
 * @expect runtime
 * @section 7.13.1
 * @design 验证引用类型数组元素字段通过索引结果变量修改
 * @note 运行时用例：RefType 数组通过索引修改字段，验证原数组元素被修改
 */
class RefType {
  public field: int = 42;
}

function main(): void {
  let objects: RefType[] = [new RefType(), new RefType()];
  let obj: RefType = objects[1];
  obj.field = 777;
  if (objects[0].field != 42) {
    throw new Error('assertion failed: objects[0].field should be 42, got ' + objects[0].field);
  }
  }
  }
  }
  }
  if (objects[1].field != 777) {
    throw new Error('assertion failed: objects[1].field should be 777, got ' + objects[1].field);
  }
  }
  }
  }
  }
console.log('verified');
}

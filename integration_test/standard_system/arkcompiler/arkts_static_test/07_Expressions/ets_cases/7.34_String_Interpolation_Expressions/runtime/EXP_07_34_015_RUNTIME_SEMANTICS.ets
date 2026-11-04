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
 * @id EXP_07_34_015_RUNTIME_SEMANTICS
 * @expect runtime
 * @section 7.34
 * @design 楠岃瘉瀛楃涓叉彃鍊艰〃杈惧紡鍦ㄨ繍琛屾椂鐨勬眰鍊兼纭€э細12 涓柇瑷€瑕嗙洊鍙橀噺鎻掑€笺€佺畻鏈〃杈惧紡銆佸琛ㄨ揪寮忋€佸竷灏斿€笺€佹柟娉曡繑鍥炲€笺€佸瓧娈佃闂€佹暟缁勭储寮曘€佹嫾鎺ョ瓑浠?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉瀛楃涓叉彃鍊肩殑杩愯鏃舵浛鎹㈢粨鏋滀笌鎵嬪姩鎷兼帴涓€鑷?
 */

// 鐢ㄤ簬娴嬭瘯鐨勯《灞傚嚱鏁?
function getValue(): int {
  return 99;
}

class Data {
  public x: int = 0;
  public label: string = '';
}

function main(): void {
  // === 1. 瀛楃涓插彉閲忔彃鍊?===
  let name: string = 'world';
  let r1: string = `hello ${name}`;
  if (r1 != 'hello world') {
    throw new Error("assertion failed: expected 'hello world', got '" + r1 + ''');
  }
  }
  }
  }
  }

  // === 2. int 鍙橀噺鎻掑€?===
  let i: int = 42;
  let r2: string = `value = ${i}`;
  if (r2 != "value = 42") {
    throw new Error("assertion failed: expected 'value = 42', got '" + r2 + ''');
  }
  }
  }
  }
  }

  // === 3. 绠楁湳琛ㄨ揪寮忔彃鍊?===
  let a: int = 2;
  let b: int = 3;
  let r3: string = `${a} + ${b} = ${a + b}`;
  if (r3 != '2 + 3 = 5') {
    throw new Error("assertion failed: expected '2 + 3 = 5', got '" + r3 + ''');
  }
  }
  }
  }
  }

  let r3b: string = `${a} * ${b} = ${a * b}`;
  if (r3b != '2 * 3 = 6') {
    throw new Error("assertion failed: expected '2 * 3 = 6', got '" + r3b + ''');
  }
  }
  }
  }
  }

  let r3c: string = `${a} - ${b} = ${a - b}`;
  if (r3c != '2 - 3 = -1') {
    throw new Error("assertion failed: expected '2 - 3 = -1', got '" + r3c + ''');
  }
  }
  }
  }
  }

  // === 4. 澶氫釜宓屽叆琛ㄨ揪寮?===
  let c: int = 5;
  let r4: string = `${a} and ${b} and ${c}`;
  if (r4 != '2 and 3 and 5') {
    throw new Error("assertion failed: multiple expressions, got '" + r4 + ''');
  }
  }
  }
  }
  }

  // === 5. 甯冨皵鍊兼彃鍊?===
  let bt: boolean = true;
  let bf: boolean = false;
  let r5: string = `${bt} and ${bf}`;
  if (r5 != 'true and false') {
    throw new Error("assertion failed: expected 'true and false', got '" + r5 + ''');
  }
  }
  }
  }
  }

  // === 6. 鏂规硶杩斿洖鍊兼彃鍊?===
  let r6: string = `value = ${getValue()}`;
  if (r6 != "value = 99") {
    throw new Error("assertion failed: expected 'value = 99', got '" + r6 + ''');
  }
  }
  }
  }
  }

  // === 7. 瀛楁璁块棶鎻掑€?===
  let data: Data = new Data();
  data.x = 77;
  data.label = 'test';
  let r7: string = `data.x = ${data.x}`;
  if (r7 != "data.x = 77") {
    throw new Error("assertion failed: expected 'data.x = 77', got '" + r7 + ''');
  }
  }
  }
  }
  }

  // === 8. 鏁扮粍绱㈠紩鎻掑€?===
  let arr: int[] = [10, 20, 30];
  let r8: string = `arr[0] = ${arr[0]}`;
  if (r8 != "arr[0] = 10") {
    throw new Error("assertion failed: expected 'arr[0] = 10', got '" + r8 + ''');
  }
  }
  }
  }
  }

  // === 9. 涓庢嫾鎺ョ粨鏋滅瓑浠?===
  let r9a: string = `The result of ${a} * ${b} is ${a * b}`;
  let r9b: string = 'The result of ' + a + ' * ' + b + ' is ' + a * b;
  if (r9a != r9b) {
    throw new Error("assertion failed: interpolation '" + r9a + '' != concat '' + r9b + ''');
  }
  }
  }
  }
  }

  // === 10. 绾弽寮曞彿锛堟棤鎻掑€硷級 ===
  let r10: string = `hello world`;
  if (r10 != 'hello world') {
    throw new Error("assertion failed: expected 'hello world', got '" + r10 + ''');
  }
  }
  }
  }
  }
console.log('verified');
}

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
 * @id CLS_09_10_039_RUNTIME_SUPER_METHOD_CALL
 * @expect runtime
 * @section 9.10
 * @design 运行时验证重写方法中通过super.method()调用父类原始实现
 * @note 运行时用例：派生类重写方法内使用super调用基类版本，验证链式调用行为
 */
class Encoder {
  public encode(data: string): string {
    return "base64(" + data + ")"
  }

  public getAlgorithm(): string {
    return "base"
  }
}

class SecureEncoder extends Encoder {
  public encode(data: string): string {
    let base: string = super.encode(data)
    return "encrypted[" + base + "]"
  }

  public getAlgorithm(): string {
    let parent: string = super.getAlgorithm()
    return "secure-" + parent
  }
}

class CompressedEncoder extends SecureEncoder {
  public encode(data: string): string {
    let parent: string = super.encode(data)
    return "gzip{" + parent + "}"
  }

  public getAlgorithm(): string {
    let parent: string = super.getAlgorithm()
    return "compressed-" + parent
  }
}

function main(): void {
  let e: Encoder = new Encoder()
  if (e.encode("hello") != "base64(hello)") {
    throw new Error("Encoder.encode failed: " + e.encode("hello"))
  }
  if (e.getAlgorithm() != "base") {
    throw new Error("Encoder.getAlgorithm failed: " + e.getAlgorithm())
  }

  let se: SecureEncoder = new SecureEncoder()
  if (se.encode("world") != "encrypted[base64(world)]") {
    throw new Error("SecureEncoder.encode failed: " + se.encode("world"))
  }
  if (se.getAlgorithm() != "secure-base") {
    throw new Error("SecureEncoder.getAlgorithm failed: " + se.getAlgorithm())
  }

  let ce: CompressedEncoder = new CompressedEncoder()
  if (ce.encode("data") != "gzip{encrypted[base64(data)]}") {
    throw new Error("CompressedEncoder.encode failed: " + ce.encode("data"))
  }
  if (ce.getAlgorithm() != "compressed-secure-base") {
    throw new Error("CompressedEncoder.getAlgorithm failed: " + ce.getAlgorithm())
  }

  console.log("super.method() call verified")
}

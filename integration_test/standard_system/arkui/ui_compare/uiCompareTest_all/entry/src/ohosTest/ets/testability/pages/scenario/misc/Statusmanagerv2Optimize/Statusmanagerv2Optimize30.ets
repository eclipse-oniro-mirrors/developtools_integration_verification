/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@ObservedV2
class Product30 {
  @Trace price: number | null = null;
}

@Entry
@ComponentV2
struct Index30 {
  product: Product30 = new Product30();

  build() {
    Column() {
      Text(`Price: ￥${this.product.price}`).fontSize(30)
      Button('Increase Price')
        .onClick(() => {
          if(this.product.price){
            this.product.price += 10; // 直接修改，UI自动刷新
          }else {
            this.product.price = 0;
          }
        })
        .id('btn')
    }
  }
}
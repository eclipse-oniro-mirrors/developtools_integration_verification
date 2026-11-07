/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct MyEmbeddedUIExtAbilityNestedPage {
  private name: string = 'MyEmbeddedUIExtAbilityNestedPage';
  @State message: string = 'MyEmbeddedUIExtAbilityNestedPage';
  @State ec_width: number = 800;
  @State ec_height: number = 500;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .margin(10)
        Row() {
          Button('Button1')
            .id(this.name + '_01')
            .margin(5)
          Button('Button2')
            .id(this.name + '_02')
            .margin(5)
        }
        .margin(10)
        Row() {
          Button('Button3')
            .margin(5)
          Button('Button4')
            .margin(5)
        }
        .margin(10)
        Row() {
          Button('Button5')
            .margin(5)
          Button('Button6')
            .margin(5)
        }
        .margin(10)
        EmbeddedComponent({
          bundleName: "com.example.uicompare",
          abilityName: "MyEmbeddedUIExtAbility",
        }, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .onError((error) => {
            console.log("MyEmbeddedUIExtAbilityNestedPage: NestedEmbeddedComponent onError, error:" + JSON.stringify(error));
            this.message = 'MyEmbeddedUIExtAbilityNestedPage: NestedEmbeddedComponent Error: code = ' + error.code + ', message = ' + error.message;
          })
          .size({width: this.ec_width, height: this.ec_height})
          .backgroundColor(Color.Blue)
      }
      .width('100%')
      .backgroundColor(Color.Orange)
    }
    .height('100%')
  }
}
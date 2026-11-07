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

@Entry
@ComponentV2
export struct ServiceQuit0020 {
  @Local showNavigation: boolean = false;
  @Local onBackpressReturn: boolean = false;
  @Local testStatus: string = '待测试';

  onBackPress(): boolean {
    if (this.onBackpressReturn) {
      this.testStatus = '✅ onBackPress返回true，阻止返回';
      return true;
    }
    this.testStatus = '⬅️ onBackPress返回false，允许退出';
    return false;
  }

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0020')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：元服务单Page无Navigation场景 + OnBackpress return false`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击"隐藏navigation"隐藏Navigation组件\n2. 点击"index:onbackpress返回值true"设置返回拦截\n3. 侧滑或点击返回按钮`)
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 15 }) {
        Row({ space: 10 }) {
          Text(`Navigation显示：`)
            .fontSize(14)
          Text(this.showNavigation ? '显示' : '隐藏')
            .fontSize(14)
            .fontColor(this.showNavigation ? Color.Green : Color.Red)
        }

        Row({ space: 10 }) {
          Text(`onBackPress拦截：`)
            .fontSize(14)
          Text(this.onBackpressReturn ? '已拦截(return true)' : '未拦截(return false)')
            .fontSize(14)
            .fontColor(this.onBackpressReturn ? Color.Red : Color.Green)
        }

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .borderRadius(10)

      Button(`隐藏navigation`)
        .id('btn')
        .onClick(() => {
          this.showNavigation = false;
          this.testStatus = 'Navigation已隐藏';
        })

      Button(`index:onbackpress返回值true`)
        .onClick(() => {
          this.onBackpressReturn = true;
          this.testStatus = 'onBackPress设置为返回true（拦截返回）';
        })

      Button(`index:onbackpress返回值false`)
        .onClick(() => {
          this.onBackpressReturn = false;
          this.testStatus = 'onBackPress设置为返回false（允许退出）';
        })

      Button(`重置`)
        .onClick(() => {
          this.showNavigation = false;
          this.onBackpressReturn = false;
          this.testStatus = '待测试';
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`当onBackPress返回false时，侧滑返回可以退出元服务`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      if (this.showNavigation) {
        Navigation() {
          Text(`Navigation组件内容`)
            .fontSize(16)
        }
        .height('8.2%')
        .border({ width: 2, color: Color.Blue })
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}


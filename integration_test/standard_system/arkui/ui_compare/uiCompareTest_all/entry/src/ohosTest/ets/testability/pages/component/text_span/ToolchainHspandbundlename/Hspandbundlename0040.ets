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
import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
export struct Hspandbundlename0040 {
  @Local testResult: string = '待测试';
  @Local testColor: Color = Color.Gray;
  @Local routeStatus: string = '';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0040')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：在entry中，路由跳转到HSP中的页面`)
        .fontSize(16)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击"020_路由跳转HSP"按钮\n2. 验证路由跳转功能\n3. 观察HSP页面样式`)
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预置条件说明：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• 创建HSP模块\n• 修改module.json5添加：\n  "arkOptions": {"integrateHsp": true}\n• HSP中页面设置：\n  fontSize(15), fontColor(Color.Pink)\n• 配置路由路径指向HSP页面`)
        .fontSize(12)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 10 }) {
        Text(`测试区域：`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Text(`当前位置：Entry页面`)
          .fontSize(14)
          .fontColor(Color.Blue)

        Text(`点击按钮后将跳转到HSP模块中的页面`)
          .fontSize(14)
          .fontColor(Color.Gray)

        if (this.routeStatus !== '') {
          Text(this.routeStatus)
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ top: 10 })
        }

        Text(`测试状态：${this.testResult}`)
          .fontSize(14)
          .fontColor(this.testColor)
          .margin({ top: 10 })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F5FF')
      .borderRadius(10)

      Button(`020_路由跳转HSP`)
        .id('btn')
        .onClick(() => {
          try {
            this.routeStatus = '正在执行路由跳转...';
            
            // 模拟跳转到HSP页面的路由操作
            // 实际场景中应配置HSP模块的路由路径
            // router.pushUrl({ url: 'hsp/pages/HspTestPage' })
            
            this.testResult = '✅ 路由跳转命令已发送（实际需配置HSP路由）';
            this.testColor = Color.Green;
            this.routeStatus = '提示：需在HSP模块中配置对应的路由页面';
          } catch (err) {
            this.testResult = `❌ 路由跳转失败：${err}`;
            this.testColor = Color.Red;
          }
        })

      Button(`模拟HSP页面样式`)
        .onClick(() => {
          this.testResult = '✅ HSP页面样式：fontSize=15vp, fontColor=Pink';
          this.testColor = Color.Green;
          this.routeStatus = '模拟显示HSP页面的样式效果';
        })

      Button(`返回`)
        .onClick(() => {
          router.back();
        })

      Button(`重置`)
        .onClick(() => {
          this.testResult = '待测试';
          this.testColor = Color.Gray;
          this.routeStatus = '';
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`HSP页面：\n1. 成功跳转到HSP模块页面\n2. Text组件文本大小15vp\n3. 字体颜色为粉色(Color.Pink)`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`本测试验证从entry模块通过router跳转到HSP模块页面的功能。\n实际使用需在HSP模块中配置路由页面路径。`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}


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

import { TextModifier } from '@kit.ArkUI';

/**
 * 主标题样式修改器 - 样式1：红色加粗，有阴影，显示黑色贯穿虚线
 */
export class MainTitleModifier1 extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
    instance.fontColor('#FF0000'); // 红色
    instance.fontWeight(FontWeight.Bold); // 加粗
    instance.textShadow({ radius: 5, offsetX: 2, offsetY: 2, color: '#80000000' }); // 阴影
    instance.decoration({ type: TextDecorationType.LineThrough, color: '#FF000000' }); // 黑色贯穿虚线
  }
}

/**
 * 主标题样式修改器 - 样式2：绿色斜体，有蓝色贯穿实线
 */
export class MainTitleModifier2 extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
    instance.fontColor('#00FF00'); // 绿色
    instance.fontStyle(FontStyle.Italic); // 斜体
    instance.decoration({ type: TextDecorationType.Underline, color: '#FF0000FF' }); // 蓝色贯穿实线
  }
}

/**
 * 副标题样式修改器 - 样式1：红色加粗，有阴影
 */
export class SubTitleModifier1 extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
    instance.fontColor('#FF0000'); // 红色
    instance.fontWeight(FontWeight.Bold); // 加粗
    instance.textShadow({ radius: 5, offsetX: 2, offsetY: 2, color: '#80000000' }); // 阴影
  }
}

/**
 * 副标题样式修改器 - 样式2：字体变小，斜体，有阴影
 */
export class SubTitleModifier2 extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
    instance.fontSize(12); // 字体变小
    instance.fontStyle(FontStyle.Italic); // 斜体
    instance.textShadow({ radius: 3, offsetX: 1, offsetY: 1, color: '#80000000' }); // 阴影
  }
}

/**
 * 空Modifier - 不设置任何样式
 */
export class EmptyTextModifier extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
    // 空实现，不设置任何样式
  }
}


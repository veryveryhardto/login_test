import 'package:flutter/material.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

renderTextFormField({
  required String label,
  required FormFieldSetter onSaved,
  required FormFieldValidator validator,
})  {
  assert(onSaved!=null);
  assert(validator!=null);

  return Column(
      children: [
        Row(
          children:[
            Text(
              label,
              style: TextStyle(
                fontSize:12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
        ),
        Container(height: 16.0),
      ]
  );
}
renderPhoneNumberFormField({
  required String label,
  required FormFieldSetter onSaved,
  required FormFieldValidator validator,

})  {
  assert(onSaved!=null);
  assert(validator!=null);

  return Column(
      children: [
        Row(
          children:[
            Text(
              label,
              style: TextStyle(
                fontSize:12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          keyboardType: TextInputType.number,
          inputFormatters: [
            MultiMaskedTextInputFormatter(
                masks: ['xxx-xxxx-xxxx', 'xxx-xxx-xxxx'], separator: '-')
          ],
          decoration: const InputDecoration(hintText: 'ex: 010-1234-5678',)
  ),
        Container(height: 16.0),
      ]
  );
}
renderBirthNumberFormField({
  required String label,
  required FormFieldSetter onSaved,
  required FormFieldValidator validator,

})  {
  assert(onSaved!=null);
  assert(validator!=null);

  return Column(
      children: [
        Row(
          children:[
            Text(
              label,
              style: TextStyle(
                fontSize:12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          keyboardType: TextInputType.number,
          inputFormatters: [
            MultiMaskedTextInputFormatter(
                masks: ['xxxx.xx.xx'], separator: '.')
          ],
          decoration: const InputDecoration(hintText: 'ex: 2022.03.06',),
        ),
        Container(height: 16.0),
      ]
  );
}
renderPWFormField({
  required String label,
  required FormFieldSetter onSaved,
  required FormFieldValidator validator,

})  {
  assert(onSaved!=null);
  assert(validator!=null);

  return Column(
      children: [
        Row(
          children:[
            Text(
              label,
              style: TextStyle(
                fontSize:12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          obscureText: true,
        ),
        Container(height: 16.0),
      ]
  );
}

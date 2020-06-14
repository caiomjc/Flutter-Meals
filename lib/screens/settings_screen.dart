import 'package:flutter/material.dart';
import '../models/settings.dart';
import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(widget.settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten',
                  widget.settings.isGlutenFree,
                  (value) =>
                      setState(() => widget.settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  widget.settings.isLactoseFree,
                  (value) =>
                      setState(() => widget.settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
                  widget.settings.isVegetarian,
                  (value) =>
                      setState(() => widget.settings.isVegetarian = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas',
                  widget.settings.isVegan,
                  (value) => setState(() => widget.settings.isVegan = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

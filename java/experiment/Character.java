public abstract class Character {
    WeaponBehavior weapon;

    public void setWeapon(WeaponBehavior wb) {
        this.weapon = wb;
    }

    public void fight() {
        weapon.useWeapon();
    }
}

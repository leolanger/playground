public class game {
    public static void main(String[] args) {
        Character king = new King();
        king.fight();
        System.out.println("Change king's weapon:");
        king.setWeapon(new AxeBehavior());
        king.fight();
        Character queen = new Queen();
        queen.fight();
        Character knight = new Knight();
        knight.fight();
        Character troll = new Troll();
        troll.fight();
    }
}
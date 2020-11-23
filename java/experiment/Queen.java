public class Queen extends Character {
    public Queen() {
        weapon = new SwordBehavior();
    }

    public void fight() {
        System.out.println("FIGHT!");
    }
}
